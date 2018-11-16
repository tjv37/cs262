package tjv37.cs262.calvin.edu.homework1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import java.util.Locale;

/**
 * Ty Vredeveld
 * Homework1; written for CS-262
 */
public class MainActivity extends AppCompatActivity {

    // Create variables to hold references to certain views
    private EditText value1EditText;
    private EditText value2EditText;
    private Spinner operatorSelect;
    private TextView calculationResult;

    /**
     * When the app is opened and the activity is created, and references
     * to the necessary views are assigned
     * @param savedInstanceState
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Variables are assigned to correct views
        value1EditText = findViewById(R.id.value1_input);
        value2EditText = findViewById(R.id.value2_input);
        operatorSelect = findViewById(R.id.operator_list);
        calculationResult = findViewById(R.id.calculation_result);
    }

    /**
     * When the 'calculate' button is pressed, a calculation is performed
     * depending on the values in the two EditText views and operator in the spinner
     * @param view
     */
    public void performCalculation(View view) {
        // Variables to hold the actual string and numerical values are assigned
        String value1 = value1EditText.getText().toString();
        String value2 = value2EditText.getText().toString();
        String selectedOperator = operatorSelect.getSelectedItem().toString();
        int value1_int, value2_int;
        double answer = 0.0;

        // Confirms that there are entries in both EditText views before trying
        // to perform any calculations
        if (!value1.isEmpty() & !value2.isEmpty()) {
            value1_int = Integer.parseInt(value1);
            value2_int = Integer.parseInt(value2);

            // Determines the operator to use based on the spinner selection
            switch (selectedOperator) {
                case "+":
                    answer = value1_int + value2_int;
                    break;
                case "-":
                    answer = value1_int - value2_int;
                    break;
                case "*":
                    answer = value1_int * value2_int;
                    break;
                case "/":
                    answer = (double) value1_int / (double) value2_int;
                    break;
            }

            // When doing addition, subtraction, or multiplication no decimal places are
            // used since none are needed; for division, however, 3 decimal places are allowed
            // in case the answer is not an exact integer
            if (answer % 1 == 0) {
                calculationResult.setText(String.format(Locale.getDefault(), "%.0f", answer));
            } else {
                calculationResult.setText(String.format(Locale.getDefault(), "%.3f", answer));
            }

        } else {
            // If an EditText view is missing an entry, this error is printed instead of an answer
            calculationResult.setText(getString(R.string.calculation_result_error));
        }
        // Makes sure an answer or error is displayed once the button is pressed no matter what
        calculationResult.setVisibility(View.VISIBLE);
    }
}
